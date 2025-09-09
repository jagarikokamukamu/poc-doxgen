#include <iostream>
#include "class.h"

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
