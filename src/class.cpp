#include <iostream>
#include "class.h"

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
