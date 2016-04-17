package mr;

import base.Base;

import java.util.Optional;
import java.util.function.Supplier;
import java.util.stream.Stream;

public class A {
    public static String getString() {
        Optional<String> o = Optional.of("NINE");
        // The method Optional.stream only exists in Java 9 ea builds
        Stream<String> os = o.stream();

        String m;
        // New Java 9 ea language feature for try-with-resources
        try (os) {
            m = os.findFirst().get();
        }

        Supplier<String> s = () -> m;
        return Base.get() + " -> " + s.get();
    }
}
