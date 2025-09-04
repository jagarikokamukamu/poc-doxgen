#ifndef TEST_H
#define TEST_H

/**
 * @brief テスト用のクラス
 */
class TestClass {
public:
    /**
     * @brief コンストラクタ
     */
    TestClass();

    /**
     * @brief 値を設定する
     * @param value 設定する整数値
     */
    void setValue(int value);

    /**
     * @brief 値を取得する
     * @return 現在の値
     */
    int getValue() const;

private:
    int value_;
};

#endif // TEST_H
