package com.Hrishikesh;

import java.util.ArrayList;
import java.util.Iterator;

public class Main {

    public static void main(String[] args) {
	// write your code here
        ArrayList<Integer> intArray = new ArrayList<>(5);
        intArray.add(16);
        intArray.add(25);
        intArray.add(14);
        intArray.add(10);
        intArray.add(35);

        //printing arraylist elements
        for (int i : intArray) {
            System.out.print(i+" ");
        }

        //sorting arraylist
        ArrayList<String> StringArr = new ArrayList<>(5);
        StringArr.add("Ketan");
        StringArr.add("bhavesh");
        StringArr.add("kunal sir");
        StringArr.add("Avinash sir");
        StringArr.add("abrar sir");

        
        System.out.println();

        Iterator iterator = StringArr.iterator();
        while(iterator.hasNext()) {
            System.out.println(iterator.next());
        }

    }
}
