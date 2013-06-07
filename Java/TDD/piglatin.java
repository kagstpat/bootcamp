final class Piglatin {
	
	public void init() {
		System.out.print("test");
	}

	public static String inputString(final String input) {

		String temp = "";
		String output = "";

		if (input == null || input.matches("[0-9]+")) {
			return "0";
		}

		for (int x = 0; x < input.length(); x++) {

			if (input.charAt(x) == 'a' || input.charAt(x) == 'e'
					|| input.charAt(x) == 'o' || input.charAt(x) == 'i'
					|| input.charAt(x) == 'u' || input.charAt(x) == 'y'
					|| input.charAt(x) == 'A' || input.charAt(x) == 'E'
					|| input.charAt(x) == 'O' || input.charAt(x) == 'I'
					|| input.charAt(x) == 'U' || input.charAt(x) == 'Y') {
				temp = input.charAt(x) + "";
			} else {
				temp = input.charAt(x) + "å" + input.charAt(x);
			}

			output = output + temp;
			if (x == input.length() - 1) {
				return output;
			}

		}

		return "0";

	}
}
