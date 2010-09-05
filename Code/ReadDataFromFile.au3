#include <BaseFunc\FileBaseFunction.au3>
#include <Array.au3>

$arr = ReadArrayDataFromFile("test.txt")

_ArrayDisplay($arr, "test return arr")