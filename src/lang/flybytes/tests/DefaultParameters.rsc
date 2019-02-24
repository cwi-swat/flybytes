module lang::flybytes::tests::DefaultParameters

import lang::flybytes::Syntax;
import lang::flybytes::Compiler;

Class defParamClass() {
  return class(object("DefParam"),
      methods=[
        staticMethod(\public(), string(), "testMethod", [var(string(), "i", init=sconst("hello!"))],[
           \return(load("i"))
        ])
      ]
    );
}

bool testDefParamSet() { 
  m = loadClass(defParamClass());
  // if you pass a string, you get the string back
  return m.invokeStatic(methodDesc(string(), "testMethod", [string()]), [prim(string(), "bye!")]).toValue(#str) == "bye!";
}

bool testDefParamUnSet() { 
  m = loadClass(defParamClass());
  // if you pass 'null' you get the default initializer expression for the parameter
  return m.invokeStatic(methodDesc(string(), "testMethod", [string]), [null()]).toValue(#str) == "hello!";
}

