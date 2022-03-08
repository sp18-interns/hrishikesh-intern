package com.Hrishikesh;

interface A {
    void show(int i);
}
public class Lambda {

    public static void main(String[] args) {
	// write your code here
        A obj = (int i) -> System.out.println("Spark-"+ i);
        obj.show(18);
    }
}
