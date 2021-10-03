package com.kobqd;

import java.util.HashMap;
import java.util.Map;

public class MapProgram {
    public static void main(String[] args) {
        Map<String,String> languages = new HashMap<>();

        if(languages.containsKey("Java")){
            System.out.println("Java is already in the map");
        }else{
            languages.put("Java","a compliled high level, object-oriented, platform independant language");
            System.out.println("Java added successfully");
        }

        languages.put("Python","a interpreted, object-oriented, high level programming language");
        languages.put("Algol","an algorithmic language");
        System.out.println(languages.put("BASIC","Beginner All Purposes Symbolic Instruction Code"));
        System.out.println(languages.put("Lisp","Therein lies madness"));

//        System.out.println(languages.get("Java"));
        if(languages.containsKey("Java")){
            System.out.println("Java is already in the map");
        }else{
            languages.put("Java","this course is about Java");
        }
//        System.out.println(languages.put("Java","this course is about Java"));
//        System.out.println(languages.get("Java"));

        System.out.println("====================================================");

//        languages.remove("Lisp");
        if(languages.remove("Algol","an algorithmic language")){
            System.out.println("Algol removed");
        }else {
            System.out.println("Algol not removed, key/value pair not found");
        }

        if (languages.replace("Lisp","Therein lies madness","a functional programming language with imperative features")){
            System.out.println("Lisp replaced");
        }else{
            System.out.println("Lisp not removed, key/value pair not found");
        }

//        System.out.println(languages.replace("Scala","this will not be added"));

        System.out.println("====================================================");
        for(String key: languages.keySet()){
            System.out.println(key + " : " + languages.get(key));
        }

    }
}
