package view;
//화면

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Checkbox;
import java.awt.CheckboxGroup;
import java.awt.Color;
import java.awt.Font;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.List;
import java.awt.Panel;//화면을 지원해주는 여러 클래스가 있는 패키지
import java.awt.TextField;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class ManagerGUI {
	//화면에 관련된 컴포넌트들을 전역 변수로 선언
	Frame frame;//윈도우창, 흰 도화지
	Panel[] panel;//도화지에 직접 그림을 그리는게 아니라 투명한 종이(Panel)에 그림을 그려서 Frame에 붙인다.
	Label lblTitle, lblName, lblHeight, lblWeight, lblSex, lblAge, lblStatus;
	//Frame에 나오는 글씨들, 제목 등..., 컴포넌트라 말한다.
	TextField tfName, tfHeight, tfWeight, tfAge;//입력하는 창
	Button btnSave, btnDelete, btnUpdate, btnReset, btnSearch;//버튼들
	List list; //컬렉션의 List가 아니라 프레임창에 보이는 정보들의 목록
	Checkbox chMale, chFemale;
	CheckboxGroup chGroup;//체크박스를 그룹화
	
	public ManagerGUI() {
		frame = new Frame("회원 관리");//윈도우창 제목
		panel = new Panel[13];//Panel의 배열
		for(int i=0;i<panel.length;i++) {
			panel[i] = new Panel();//Panel을 객체 생성해서 배열에 넣기
		}
		lblTitle = new Label("회원 관리", Label.CENTER);//회원관리라는 라벨을 가운데에 위치시킴
		Font font = new Font("dialog", Font.BOLD, 20);//글씨체 만들기
		lblTitle.setFont(font);//글씨체 변경
		lblTitle.setForeground(new Color(123,54,32));//라벨에 색을 넣는 것
		lblName = new Label("이름");
		lblAge = new Label("나이");
		lblHeight = new Label("키");
		lblWeight = new Label("체중");
		lblSex = new Label("성별");
		lblStatus = new Label("");
		lblStatus.setBackground(Color.LIGHT_GRAY);//라벨에 색을 넣는 것2
		tfName = new TextField("");
		tfHeight = new TextField("");
		tfWeight = new TextField("");
		tfAge = new TextField("");
		btnSave = new Button("저장");
		btnSearch = new Button("검색");
		btnDelete = new Button("삭제");
		btnUpdate = new Button("수정");
		btnReset = new Button("지우기");
		chGroup = new CheckboxGroup();
		chMale = new Checkbox("Male", chGroup, false);
		chFemale = new Checkbox("FeMale", chGroup, false);
		//list 객체를 생성, 7은 줄 수, false는 1개만 눌러지는 것 true면 2개를 누르면 2개가 탭 잡힘
		list = new List(7,false);
		//선택 동그라미에 체크가 되있게 하고 싶으면 true, 아니면 false
		
		//닫기 버튼 활성화
		frame.addWindowListener(new WindowAdapter() {//WindowListener에 들어있는 것을 클래스로 만들어 놓은 것
			//WindowListener = x버튼이나 최소화버튼 등을 눌렀는지 감지하는 것
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
		//클릭하면 나오는 것 = 이벤트코드
		//XXXListener = 누르면 동작하는 것
		list.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				//사용자가 정보를 누르면 상세 정보가 나오는 것
				//유관순을 누르면 유관순에 관한 정보가 String으로 나오는 것
				String str = list.getSelectedItem();
				StringTokenizer st = new StringTokenizer(str);
				tfName.setText(st.nextToken());
				tfAge.setText(st.nextToken());
				tfWeight.setText(st.nextToken());
				tfHeight.setText(st.nextToken());
				//남자인 경우는 남자에 체크, 여자인 경우 여자에 체크
				String sex = st.nextToken();//남, 여라는 글씨가 들어옴
				if(sex.equals("남")) {
					chMale.setState(true);//동그라미에 체크하는 것
				}else {
					chFemale.setState(true);
				}
			}
		});
	
	}//end 생성자
	
	
	private void lanuchFrame() {//화면을 띄우는 메소드 선언
		//GridLayout : 배열로 되어있는 Layout, 화면 배치를 행과 열로 한다.
		panel[1].setLayout(new GridLayout(2,1));
		panel[1].add(lblName);//1행
		panel[1].add(lblHeight);//2행
		panel[2].setLayout(new GridLayout(2,1));
		panel[2].add(tfName);
		panel[2].add(tfHeight);
		//BorderLayout : 현재 위치에서 동서남북, 가운데로 배치
		panel[3].setLayout(new BorderLayout());
		panel[3].add(panel[1], "West");
		panel[3].add(panel[2], "Center");
		panel[3].add(new Label(""), "East");
		panel[4].setLayout(new GridLayout(2,1));
		panel[4].add(lblAge);
		panel[4].add(lblWeight);
		panel[5].setLayout(new GridLayout(2,1));
		panel[5].add(tfAge);
		panel[5].add(tfWeight);
		panel[6].setLayout(new BorderLayout());
		panel[6].add(panel[4], "West");
		panel[6].add(panel[5], "Center");
		panel[6].add(new Label(""), "East");//중간에 공백을 넣은 것
		panel[7].setLayout(new GridLayout(1,2));
		panel[7].add(panel[3]);
		panel[7].add(panel[6]);
		panel[8].add(lblSex);
		panel[8].add(chMale);
		panel[8].add(chFemale);
		panel[9].setLayout(new BorderLayout());
		panel[9].add(lblTitle, "North");
		panel[9].add(panel[7], "Center");
		panel[9].add(panel[8], "South");
		panel[10].setLayout(new GridLayout(1,5));
		panel[10].setBackground(Color.black);
		panel[10].setForeground(Color.white);
		panel[10].add(new Label("이 름   "));
		panel[10].add(new Label("나 이   "));
		panel[10].add(new Label("체 중  "));
		panel[10].add(new Label(" 키    "));
		panel[10].add(new Label("성 별   "));
		panel[11].setLayout(new BorderLayout());
		panel[11].add(panel[10], "North");
		panel[11].add(list, "Center");
		panel[0].add(btnSave);//저장버튼을 붙임
		panel[0].add(new Label(" "));//버튼과 버튼 사이에 공백
		panel[0].add(btnSearch);
		panel[0].add(new Label(" "));
		panel[0].add(btnDelete);
		panel[0].add(new Label(" "));
		panel[0].add(btnUpdate);
		panel[0].add(new Label(" "));
		panel[0].add(btnReset);
		panel[0].add(new Label(" "));
		panel[12].setLayout(new BorderLayout());
		panel[12].add(panel[9], "North");
		panel[12].add(panel[11], "Center");
		panel[12].add(panel[0], "South");
		
		frame.add(panel[12], "Center");
		frame.add(lblStatus, "South");
		frame.pack();//내용물에 알맞게 윈도우창 크기 조절
		frame.setResizable(false);//윈도우창 사이즈 조절 안되게 막기
		//윈도우창을 x,y 좌표를 줘서 가운데로 오게 만드는 것
		frame.setLocation((frame.getToolkit().getScreenSize().width - frame.getWidth()) / 2, 
				(frame.getToolkit().getScreenSize().height - frame.getHeight()) / 2);
				//전체크기 - 프레임의 크기 / 2
		frame.setVisible(true);//화면 보이게 하기
		
		displayAll();
		
		
	}//end launchFrame
	
	//회원 정보 보는 메소드
	public void displayAll() {
		list.removeAll();//List(awp) 화면을 클리어
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> allData = dao.select();
		for(MemberDTO dto : allData) {
			String name = dto.getName();
			int age = dto.getAge();
			int height = dto.getHeight();
			int weight = dto.getWeight();
			char sex = dto.getSex();
			list.add(name+"   "+age+"   "+weight+"   "+height+"   "+sex);//List클래스의 list
		}
	}


	public static void main(String[] args) {
		ManagerGUI mem = new ManagerGUI();
		mem.lanuchFrame();//화면을 띄우는 메소드
	}

}
