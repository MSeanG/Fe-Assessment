export const equals = (a, b) =>
  a.length === b.length && a.every((element, index) => element === b[index]);
