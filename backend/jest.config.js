module.exports = {
  bail: true,
  testMatch: ['**/src/test/**/*.test.js?(x)'],
  collectCoverage: true,
  collectCoverageFrom: ['src/**', '!src/test/**', '!src/database/migrations/**'],
};
