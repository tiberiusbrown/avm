struct SeparateBase {
    virtual int value(int input) const;
    virtual ~SeparateBase();
};

struct SeparateDerived : SeparateBase {
    explicit SeparateDerived(int bias);
    int value(int input) const override;
    ~SeparateDerived() override;

    int bias;
};

using SeparateMethod = int (SeparateBase::*)(int) const;

SeparateMethod separate_method();
int separate_destructor_count();
