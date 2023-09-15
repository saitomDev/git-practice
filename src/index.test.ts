const { greeting } = require("./index");

describe("関数「greeting」のテスト", () => {
  test("関数「greeting」のテスト", () => {
    expect(greeting()).toBe("hello");
  });
});