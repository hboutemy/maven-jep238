package mr;

import base.Base;

import java.util.function.Supplier;

public class A {
    public static String getString() {
        Supplier<String> s = () -> "EIGHT";
        return Base.get() + " -> " + s.get();
    }
}
