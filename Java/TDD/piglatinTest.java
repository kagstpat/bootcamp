import static org.junit.Assert.*;

import org.junit.Test;

public class PiglatinTest {

	@Test
	public final void testReturnNull() throws Exception {
		assertEquals("0", Piglatin.inputString(null));
	}

	@Test
	public final void testRaronA() throws Exception {
		assertEquals("p�p", Piglatin.inputString("p"));
	}

	@Test
	public final void testDoubleLetters() throws Exception {
		assertEquals("g�gb�b", Piglatin.inputString("gb"));
	}

	@Test
	public final void testMultipleLetters() throws Exception {
		assertEquals("ab�bc�c", Piglatin.inputString("abc"));
	}
	
	@Test
	public final void testBigLetterCombinations() throws Exception {
		assertEquals("P�Pat�tr�rik�k", Piglatin.inputString("Patrik"));
	}
	
	@Test
	public final void testNumbers() throws Exception {
		assertEquals("0", Piglatin.inputString("123"));
	}
	
	@Test
	public final void testBigLetterCombinations2() throws Exception {
		assertEquals("An�nd�der�rs�s", Piglatin.inputString("Anders"));
	}
}
