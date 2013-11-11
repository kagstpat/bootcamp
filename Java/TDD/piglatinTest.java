import static org.junit.Assert.*;

import org.junit.Test;

public class PiglatinTest {

	@Test
	public final void testReturnNull() throws Exception {
		assertEquals("0", Piglatin.inputString(null));
	}

	@Test
	public final void testRaronA() throws Exception {
		assertEquals("påp", Piglatin.inputString("p"));
	}

	@Test
	public final void testDoubleLetters() throws Exception {
		assertEquals("gågbåb", Piglatin.inputString("gb"));
	}

	@Test
	public final void testMultipleLetters() throws Exception {
		assertEquals("abåbcåc", Piglatin.inputString("abc"));
	}
	
	@Test
	public final void testBigLetterCombinations() throws Exception {
		assertEquals("PåPatåtrårikåk", Piglatin.inputString("Patrik"));
	}
	
	@Test
	public final void testNumbers() throws Exception {
		assertEquals("0", Piglatin.inputString("123"));
	}
	
	@Test
	public final void testBigLetterCombinations2() throws Exception {
		assertEquals("Anåndåderårsås", Piglatin.inputString("Anders"));
	}
}
