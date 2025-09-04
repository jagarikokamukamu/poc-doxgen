#include <iostream>
#include "test.h"

/**
 * @brief TestClassのコンストラクタ
 */
TestClass::TestClass() : value_(0) {}

/**
 * @brief 値を設定する
 * @param value 設定する整数値
 */
void TestClass::setValue(int value) {
    value_ = value;
}

/**
 * @brief 値を取得する
 * @return 現在の値
 */
int TestClass::getValue() const {
    return value_;
}

/**
 * @brief メイン関数
 * @return 終了コード
 */
int main() {
    TestClass obj;
    obj.setValue(42);
    std::cout << "Value: " << obj.getValue() << std::endl;
    return 0;
}
