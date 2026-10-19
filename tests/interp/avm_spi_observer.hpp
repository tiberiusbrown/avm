#pragma once

#include <absim.hpp>

#include <sstream>
#include <stdexcept>

namespace avm_test {

// Observe writes without changing Ardens' timing, flags, TX, or RX. Physical
// FX-C measurements show that the intentional dummy OUT at cycle 17 sets
// WCOL while advancing the stream; an earlier write is ignored, and nonzero
// data at the cycle-17 boundary would be replaced by zero.
inline void checked_spi_write(absim::atmega32u4_t& cpu, uint16_t ptr, uint8_t value)
{
    bool active = (cpu.data[absim::reg::addr::SPCR] &
                   (absim::reg::bit::SPCR::SPE | absim::reg::bit::SPCR::MSTR)) ==
                  (absim::reg::bit::SPCR::SPE | absim::reg::bit::SPCR::MSTR);
    bool ignored = active && cpu.spi_busy &&
                   cpu.cycle_count < cpu.spi_transmit_zero_cycle;
    bool corrupted = active && value != 0 &&
                     cpu.cycle_count == cpu.spi_transmit_zero_cycle;
    absim::atmega32u4_t::spi_handle_st_spdr(cpu, ptr, value);
    if(ignored || corrupted) {
        std::ostringstream error;
        error << (ignored ? "ignored SPI write" : "nonzero cycle-17 SPI write")
              << " at AVR byte PC 0x" << std::hex << cpu.pc * 2
              << " value=0x" << unsigned(value) << std::dec
              << " cycle=" << cpu.cycle_count;
        throw std::runtime_error(error.str());
    }
}

inline void observe_spi_writes(absim::atmega32u4_t& cpu)
{
    cpu.st_handlers[absim::reg::addr::SPDR] = checked_spi_write;
    cpu.enabled_autobreaks.reset(absim::AB_SPI_WCOL);
}

} // namespace avm_test
