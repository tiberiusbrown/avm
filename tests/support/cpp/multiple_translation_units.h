struct MultiBase {
    virtual int step(int input) const = 0;
    virtual ~MultiBase();
};

struct MultiDerived : MultiBase {
    int step(int input) const override;
};

int multi_helper(int input);
int multi_dispatch(MultiBase* object, int input);
int multi_call_count();
