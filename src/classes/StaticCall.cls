/*
*    Description : Class to perform all OOPS operations 
*
*    Version        Author            Date            Description
*  
*    1.0            Kaajal Bhawale    03/03/2015      Initial Draft
*/

public class StaticCall {

    Integer nonStaticVariable = 0;

    //Constructor that calls a static method in another class
    public StaticCall(){
    //call to static method using class name.methodname
        StaticClass.staticMethod(); 
        print();
    }

    //void method
    public void print(){
        System.debug('Hello World');
    }


    //method to explain use of static and non satic variable
    public void executableVariable(){
        nonStaticVariable  = nonStaticVariable + 1;
        System.debug('The value of non static variable is '+nonStaticVariable);
    }

}