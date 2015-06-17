package mv;

import base.Base;

import java.util.function.Supplier;

public class A {
    public static String getString() {
        Supplier<String> s = () -> "NINE";
        return Base.get() + " -> " + s.get();
    }
}
