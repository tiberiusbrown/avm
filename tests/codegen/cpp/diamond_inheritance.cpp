struct Root {
    int tag;
    virtual int value() const;
};

struct Left : virtual Root {
    int left;
    virtual int left_value() const;
};

struct Right : virtual Root {
    int right;
    virtual int right_value() const;
};

struct Diamond : Left, Right {
    int value() const override;
    int left_value() const override;
    int right_value() const override;
};

int Root::value() const { return tag; }
int Left::left_value() const { return left; }
int Right::right_value() const { return right; }
int Diamond::value() const { return tag + left + right; }
int Diamond::left_value() const { return left + 1; }
int Diamond::right_value() const { return right + 2; }

__attribute__((noinline)) static int root_value(Root* object) {
    return object->value();
}

__attribute__((noinline)) static int right_value(Right* object) {
    return object->right_value();
}

extern "C" int avm_test_main() {
    Diamond object;
    object.tag = 7;
    object.left = 11;
    object.right = 13;
    Left* left = &object;
    Right* right = &object;
    Root* from_left = left;
    Root* from_right = right;
    if (from_left != from_right)
        return 1;
    if (root_value(from_left) != 31 || root_value(from_right) != 31)
        return 2;
    if (left->left_value() != 12 || right_value(right) != 15)
        return 3;
    if (from_left->tag != 7)
        return 4;
    return 0;
}
