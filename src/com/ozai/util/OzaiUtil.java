package com.ozai.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.Arrays;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.TimeZone;
import java.util.UUID;
import java.util.function.Supplier;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.springframework.web.multipart.MultipartFile;

import com.ozai.beans.ExpenseList;
import com.ozai.beans.ResidentsData;
import com.ozai.beans.TicketsData;

public class OzaiUtil {

	public static Date getCurrentDate() {

		java.util.Date today = new java.util.Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
		String IST = df.format(today);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = format.parse(IST);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date currentDate = new java.sql.Date(utilDate.getTime());
		return currentDate;

	}
	
	public static String getCurrentMonth() {

		java.util.Date today = new java.util.Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
		String IST = df.format(today);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = format.parse(IST);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date currentDate = new java.sql.Date(utilDate.getTime());
		String dateS = currentDate.toString();
		String monthS = dateS.substring(0,7);
		return monthS;

	}
	
	public static Supplier<String> currentMonth = () -> {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentDate());
		return String.valueOf(cal.get(Calendar.MONTH) + 1);
	};
	
	public static Supplier<String> previousMonth1 = () -> {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentDate());
		return String.valueOf(cal.get(Calendar.MONTH));
	};
	
	public static Supplier<String> previousMonth2 = () -> {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentDate());
		return String.valueOf(cal.get(Calendar.MONTH - 1));
	};
	
	public static Supplier<Integer> currentYear = () -> {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getCurrentDate());
		return cal.get(Calendar.YEAR);
	};

	public static Date getExpDt() {

		Calendar calender = Calendar.getInstance(TimeZone.getTimeZone("IST"),
				Locale.ENGLISH);
		calender.add(Calendar.YEAR, 1);
		long time = calender.getTimeInMillis();
		Date expdt = new Date(time);
		System.out.println("Expiry Date is " + expdt);
		return expdt;

	}
	
	public static Date getVacateNoticeDt(int days) {

		Calendar calender = Calendar.getInstance(TimeZone.getTimeZone("IST"),
				Locale.ENGLISH);
		calender.add(Calendar.DATE, days);
		long time = calender.getTimeInMillis();
		Date expdt = new Date(time);
		System.out.println("Expiry Date is " + expdt);
		return expdt;

	}

	public static File multipartToFile(MultipartFile multipart)
			throws IllegalStateException, IOException {
		File convFile = new File(multipart.getOriginalFilename());
		multipart.transferTo(convFile);
		return convFile;
	}

	public static String readWordDocument(String filepath, String filename)
			throws IOException {

		FileInputStream fs = null;
		StringBuilder textEntry = new StringBuilder();
		XWPFDocument documentx = null;
		HWPFDocument document = null;
		WordExtractor wordExtractor = null;
		try {
			fs = new FileInputStream(filepath);
			if (fs.available() >= 512) {

				if (filename.endsWith("docx")) {

					documentx = new XWPFDocument(fs);

					List<XWPFParagraph> paragraphs = documentx.getParagraphs();

					for (XWPFParagraph para : paragraphs) {
						textEntry.append("<p>" + para.getText() + "</p>");
					}

				} else if (filename.endsWith("doc")) {

					document = new HWPFDocument(fs);
					wordExtractor = new WordExtractor(document);

					String[] paragraphs = wordExtractor.getParagraphText();

					for (int i = 0; i < paragraphs.length; i++) {

						textEntry.append("<p>" + paragraphs[i] + "</p>");
					}

				}

				return textEntry.toString();
			} else {
				return "Other did not provided valid content";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fs != null)
				fs.close();
			if (documentx != null)
				documentx.close();
			if (wordExtractor != null)
				wordExtractor.close();

		}
		return null;
	}

	public static boolean isDateIsToday(String likeDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date likedate = null;
		try {
			likedate = df.parse(likeDate);

			java.util.Date today = new java.util.Date();
			if (df.parse(df.format(today)).equals(likedate)) {
				return true;
			} else
				return false;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	public static LinkedHashMap<String, List<String>> buildQuiz(
			String questions, String keySet) {
		LinkedHashMap<String, List<String>> quiz = new LinkedHashMap<String, List<String>>();

		if (questions != null && keySet != null) {
			String[] quizArr = questions.split("\\?");
			String[] answrs = keySet.split("\\?");

			for (int i = 0; i < quizArr.length; i++) {
				String[] spcfcKey = answrs[i].split("!");
				quiz.put(quizArr[i], Arrays.asList(spcfcKey));
			}

		}

		for (Entry<String, List<String>> entry : quiz.entrySet()) {
			System.out.println(entry.getKey() + ":::" + entry.getValue());
		}
		return quiz;

	}

	public static Time convertStringToSqlTime(String time) {
		java.sql.Time sqlTime = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			java.util.Date utilDate = format.parse(time);
			long t = utilDate.getTime();
			sqlTime = new Time(t);
		} catch (ParseException exception) {
			exception.printStackTrace();
		}
		return sqlTime;
	}
	
	public static Time convertStringToSqlTime(long time) throws ParseException {
		java.sql.Time sqlTime = null;
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		//java.util.Date utilDate = format.parse(time);
		long t = time; //utilDate.getTime();
		sqlTime = new Time(t);
		return sqlTime;
	}
	
	public static Date convertStringToSqlDate(String param) {
		java.sql.Date sqlDate = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			java.sql.Date utilDate = (Date) format.parse(param);
			//long t = utilDate.;
			sqlDate = (Date) utilDate;
		} catch (ParseException exception) {
			exception.printStackTrace();
		}
		return sqlDate;
	}
	
	public static java.sql.Date convertStringToSqlDate1(String param) {
		java.sql.Date sqlDate = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date newDate = (java.util.Date) format.parse(param);
			//long t = utilDate.;
			sqlDate = (java.sql.Date) newDate;
		} catch (ParseException exception) {
			exception.printStackTrace();
		}
		return sqlDate;
	}

	public static Time getSqlTimeDiff(String totalTime, String balTime) {
		long hours = 0, minutes = 0, seconds = 0;
		try {
			java.sql.Time oldTime = java.sql.Time.valueOf(totalTime);
			java.sql.Time currentTime = java.sql.Time.valueOf(balTime);
			long milliseconds1 = oldTime.getTime();
			long milliseconds2 = currentTime.getTime();
			long diff = milliseconds2 - milliseconds1;
			long diffSeconds = diff / 1000;
			hours = Math.abs(diffSeconds) / 3600;
			minutes = (Math.abs(diffSeconds) % 3600) / 60;
			seconds = Math.abs(diffSeconds) % 60;
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return convertStringToSqlTime(hours + ":" + minutes + ":" + seconds);
	}
	
	public static String getTimeTaken(Timestamp openTime, Timestamp closeTime) {
			 
			java.util.Date date = new java.util.Date();
		    Timestamp timestamp1 = new Timestamp(openTime.getTime());
		    String timeTaken=null;
		     // create a calendar and assign it the same time
		    Calendar cal = Calendar.getInstance();
		    cal.setTimeInMillis(timestamp1.getTime());
		 
		    // add a bunch of seconds to the calendar 
		    cal.add(Calendar.SECOND, 98765);
		 
		    // create a  second time stamp
		    Timestamp timestamp2 = new Timestamp(closeTime.getTime());
		 
		    // get time difference in seconds
		    long milliseconds = timestamp2.getTime() - timestamp1.getTime();
		    //int seconds = (int) milliseconds / 1000;
		 
		    // calculate hours minutes and seconds
		    //int hours = seconds / 3600;
		    //int minutes = (seconds % 3600) / 60;
		    //seconds = (seconds % 3600) % 60;
		    //int days = hours/24;
		 
		    
		    int totalSeconds = (int) Math.floor(milliseconds / 1000);
		    int totalMinutes = (int) Math.floor(totalSeconds / 60);
		    int totalHours = (int) Math.floor(totalMinutes / 60);
		    int days = (int) Math.floor(totalHours / 24);

		    int seconds = (int) totalSeconds % 60;
		    int minutes = (int) totalMinutes % 60;
		    int hours = (int) totalHours % 24;

		    String time = "1s";
		    if (days > 0) {
		      time = +days+ " Days," +hours+ " Hours,"+minutes+ " Minutes," +seconds+ " Seconds";
		    } else if (hours > 0) {
		    	time = +hours+ " Hours,"+minutes+ " Minutes," +seconds+ " Seconds";
		    } else if (minutes > 0) {
		    	time = +minutes+ " Minutes," +seconds+ " Seconds";
		    } else if (seconds > 0) {
		    	time = +seconds+ " Seconds";
		    }
		    return time;
	        
	       
	    }
		

	public static int getDifferenceInDays(java.util.Date date1,
			java.util.Date date2) {

		final long MILLIS_PER_DAY = 24 * 3600 * 1000;
		long msDiff = date1.getTime() - date2.getTime();
		long daysDiff = Math.round(msDiff / ((double) MILLIS_PER_DAY));
		return (int) daysDiff;
	}

	
	public static String buildTestMail(String subject) {
		String body = "<div style='background-color: #d9edf7; border-color: #bce8f1; color: #31708f; padding: 15px; margin-bottom: 20px; border: 1px solid transparent;'>"
				+"<p>&nbsp;</p>"
				+"<img src='http://mysuperbrain.in/img/msk.png' style='width: 100%'"
				+"<hr><p>&nbsp;</p>"
				+ "<h3>Dear Parent, "
				+ " !</h3>" + "<p>Thanks for participating in the My Super Kid Challenge. We are extremely happy to now showcase your child's talent to the whole world.</p>"
				+ "<p>You can view the submission here  :</p>"
				
				+ "<br>"
				+ "<p>You can promote it on social media to get more people to recognize your child's talents. We will send you weekly updates about the recognition your kid is getting and we are sure you would be the happiest parent soaking in all the adulation.</p>"
				+ "<p>We request you to invite 3 parents to participate in this #mysuperkid challenge so that we can have millions of parents sharing the talents of their kids and building a society where every dream is realized and every talent nurtured.</p>"
				+ "<h3>All the best !</h3>"
				+ "<p>Thanks & Regards,</p>"
				+ "<p>Team Tikaana.</p>" + "</div>";
		return body;
	}
	
	public static String buildResidentsDataForChart(
			List<ResidentsData> amount) {

		StringBuilder pointsData = new StringBuilder();

		for (ResidentsData expense : amount) {
			pointsData.append("[");
			pointsData.append("'");
			pointsData.append(expense.getProperty());
			pointsData.append("',");
			pointsData.append(expense.getStrength());
			pointsData.append("],");
			pointsData.append("\n");

		}
		System.out.println(pointsData.toString());
		return pointsData.toString();
	}
	
	public static String buildResidentsPropertyDataForChart(List<ResidentsData> amount) {
	    StringBuilder pointsData = new StringBuilder();
	    pointsData.append("["); // Start of the array
	    for (ResidentsData expense : amount) {
	        pointsData.append("'"); // Start of the string
	        pointsData.append(expense.getProperty()); // Append the property name
	        pointsData.append("',"); // End of the string with comma for separation
	    }
	    pointsData.append("]"); // End of the array
	    return pointsData.toString();
	}

	
	public static String buildResidentsBothForChart(List<ResidentsData> amount) {
	    StringBuilder pointsData = new StringBuilder();
	    pointsData.append("["); // Start of the array
	    for (ResidentsData expense : amount) {
	        pointsData.append("{"); // Start of the object
	        pointsData.append("value: "); // Property 'value'
	        pointsData.append(expense.getStrength()); // Append the strength value
	        pointsData.append(","); // Separator
	        pointsData.append("name: "); // Property 'name'
	        pointsData.append("'"); // Start of the string
	        pointsData.append(expense.getProperty()); // Append the property name
	        pointsData.append("'"); // End of the string
	        pointsData.append("},"); // End of the object with comma for separation
	    }
	    pointsData.append("]"); // End of the array
	    return pointsData.toString();
	}

	
	public static String buildTicketsDataForChart(
			List<TicketsData> amount) {

		StringBuilder pointsData = new StringBuilder();

		for (TicketsData expense : amount) {
			pointsData.append("[");
			pointsData.append("'");
			pointsData.append(expense.getStatus());
			pointsData.append("',");
			pointsData.append(expense.getCount());
			pointsData.append("],");
			pointsData.append("\n");

		}
		System.out.println(pointsData.toString());
		return pointsData.toString();
	}
	
	public static String buildTicketsDataForChart2(
			List<TicketsData> amount) {

		StringBuilder pointsData = new StringBuilder();

		for (TicketsData expense : amount) {
			pointsData.append("[");
			pointsData.append("'");
			pointsData.append(expense.getCategory());
			pointsData.append("',");
			pointsData.append(expense.getCount());
			pointsData.append("],");
			pointsData.append("\n");

		}
		System.out.println(pointsData.toString());
		return pointsData.toString();
	}

	public static String buildExpenseDataForChart(List<ExpenseList> expenseData) {
		StringBuilder pointsData = new StringBuilder();

		for (ExpenseList expense : expenseData) {
			pointsData.append("[");
			pointsData.append("'");
			pointsData.append(expense.getCategory());
			pointsData.append("',");
			pointsData.append(expense.getTotal_amount());
			pointsData.append("],");
			pointsData.append("\n");

		}
		System.out.println(pointsData.toString());
		return pointsData.toString();
	}

	public static String buildOTPMail(String name, String emial, String password) {
		String body = "<div dir='ltr'>"
				+ "<div><b><font size='4'>Dear "+name+""
				+ ",</font></b>"
				+ "<h4>Registration successfull.</h4>"
				+ "<br><br><br>"
				+ "<h5>Password for your account at Ozai Living is : "+password+"</h5>"
				+ "</div>"
				+ "<p>Thanks & Regards,</p>"
				+ "<p>Team Ozai-Living.</p>" + "</div>";
		return body;
	}
	
}
