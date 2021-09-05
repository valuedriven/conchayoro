module.exports = {  

    root: true,  
    
    parser: 'vue-eslint-parser',  
    parserOptions: {    
        'parser': 'babel-eslint',    
        'ecmaVersion': 2017,    
        'sourceType': 'module' 
    },  
    env: {    
        browser: true,    
        es6: true,  
    },  
    extends: [    
        'plugin:vue/recommended'
    ]
,}