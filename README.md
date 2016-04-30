# npy2swift
*Convert npy files to swift arrays*

This is an experimental project. Right now it only supports [v1.0 of npy format](https://github.com/numpy/numpy/blob/master/doc/neps/npy-format.rst#format-specification-version-10) and `ndarray`. The program basically ignores the header string but use the `shape` field to get the total number in the array.

The program will import `ndarray` as an swift array. The original `ndarray` will be stored in the swift array in row major form.

### Example

```swift
let result : [Float] = npy2array("test.npy", sample: Float(0))
```

The provided `test.npy` contains 96*3*3*3 elements, and all the elements are 29.