package mv;

import java.util.stream.Stream; // JDK 8: compiling with JDK 7 should fail (either using toolchains or AnimalSniffer)

public class A {
    Stream<String> s = null;

    public static String getString() {
        return "BASE";
    }
}
