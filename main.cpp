#include<iostream>
#include "edit_distance.h"
using std::cout;

int main() {
    std::cout << edit_distance("cat", "cut") << std::endl;   // 1
    std::cout << edit_distance("cat", "cats") << std::endl;  // 1
    std::cout << edit_distance("cat", "dog") << std::endl;   // 3
}