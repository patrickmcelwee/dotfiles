module.exports = {
  'env': {
    'browser': true
  },
  'extends': ['eslint:recommended'],
  'globals': {
    'angular': true,
    '_': true
  },
  'rules': {
    'camelcase': [
      'error'
    ],
    'dot-notation': [
      'error'
    ],
    'indent': [
      'error',
      2
    ],
    'linebreak-style': [
      'error',
      'unix'
    ],
    'max-len': [
      'error',
      100
    ],
    'no-multiple-empty-lines': [
      'error',
      {'max': 1}
    ],
    'no-trailing-spaces': [
      'error'
    ],
    'space-infix-ops': [
      'error'
    ],
    'no-use-before-define': [
      'error',
      {'functions': false}
    ],
    'quotes': [
      'error',
      'single'
    ],
    'semi': [
      'error',
      'always'
    ]
  }
};
