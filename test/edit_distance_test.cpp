#include <gtest/gtest.h>
#include "edit_distance.h"

TEST(EditDistanceTest, SameStrings) {
    EXPECT_EQ(edit_distance("cat", "cat"), 0);
}

TEST(EditDistanceTest,Insert){
    EXPECT_EQ(edit_distance("cat","cats"), 1);
}

TEST(EditDistanceTest, Delete) {
    EXPECT_EQ(edit_distance("cats", "cat"), 1);
}

TEST(EditDistanceTest, Replace) {
    EXPECT_EQ(edit_distance("cat", "cut"), 1);
}

TEST(EditDistanceTest, EmptyString) {
    EXPECT_EQ(edit_distance("", "abc"), 3);
}

TEST(EditDistanceTest, InsertOneChar) {
    EXPECT_EQ(edit_distance("cat", "cats"), 1);
}

TEST(EditDistanceTest, ReplaceChar) {
    EXPECT_EQ(edit_distance("cat", "cut"), 1);
}