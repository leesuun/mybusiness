package survey;

import java.time.LocalDate;

public class Format {
	public String formatString(String str) {
		return String.format("%02d", Integer.parseInt(str));
	}

	public boolean compareStartEndDate(String s, String e) {
		/* 결과가 0보다 크면 종료일이 더 앞날짜임 */
		if (LocalDate.parse(s).compareTo(LocalDate.parse(e)) >= 0) {
			System.out.println("실패");
			return true;
		}
		System.out.println("성공");
		return false;
	}
}