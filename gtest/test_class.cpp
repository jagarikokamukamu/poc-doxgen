// filepath: /home/shared-work/poc-doxygen/poc-doxgen/gtest/test_class.cpp
#include <gtest/gtest.h>
#include "class.h"

TEST(TestClassTest, DefaultConstructorInitializesValueToZero) {
    TestClass obj;
    EXPECT_EQ(obj.getValue(), 0);
}

TEST(TestClassTest, SetValueUpdatesValue) {
    TestClass obj;
    obj.setValue(42);
    EXPECT_EQ(obj.getValue(), 42);
}

TEST(TestClassTest, SetValueNegative) {
    TestClass obj;
    obj.setValue(-100);
    EXPECT_EQ(obj.getValue(), -100);
}

TEST(TestClassTest, MultipleSetValueCalls) {
    TestClass obj;
    obj.setValue(10);
    EXPECT_EQ(obj.getValue(), 10);
    obj.setValue(20);
    EXPECT_EQ(obj.getValue(), 20);
    obj.setValue(0);
    EXPECT_EQ(obj.getValue(), 0);
}