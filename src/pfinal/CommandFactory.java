package pfinal;

import kit.Command;
import pfinal.ProjectList.cl_agree;
import pfinal.ProjectList.cl_prolist;
import pfinal.ProjectList.cl_prolist_info;
import pfinal.ProjectList.cl_prolist_test;
import pfinal.ProjectList.cl_prolist_update;
import pfinal.ProjectList.cl_prolist_update_delete;
import pfinal.ProjectList.cl_prolist_update_final;
import pfinal.ProjectList.cl_up;
import pfinal.ProjectList.prolist;
import pfinal.ProjectList.prolist_update_delete;
import pfinal.ProjectList.prolist_update_refusal;
import pfinal.board.Info.GetBoardCommand;
import pfinal.board.Info.ImgUploadCommand;
import pfinal.board.Info.mup;
import pfinal.board.Info.up;
import pfinal.board.List.ListCommand;
import pfinal.board.List.PrivateListCommand;
import pfinal.board.List.WriteCommand;
import pfinal.board.List.WriteProcCommand;
import pfinal.board.interest.InterListCommand;
import pfinal.board.interest.inter;
import pfinal.cl_Project.RF.cl_Evaluate_Project;
import pfinal.cl_Project.RF.cl_Evaluate_Project_Upload;
import pfinal.cl_Project.RF.cl_Project_Fin_Up;
import pfinal.cl_Project.RF.cl_Project_Fin_View;
import pfinal.cl_Project.RF.cl_Project_View;
import pfinal.cl_Project.RF.cl_RF_Project_List;
import pfinal.fr_Project.RF.fr_Evaluate_Project;
import pfinal.fr_Project.RF.fr_Evaluate_Project_Upload;
import pfinal.fr_Project.RF.fr_Project_Fin_Up;
import pfinal.fr_Project.RF.fr_Project_Fin_View;
import pfinal.fr_Project.RF.fr_Project_View;
import pfinal.fr_Project.RF.fr_RF_Project_List;
import pfinal.friend.Friend_add;
import pfinal.friend.Friend_add_confrim;
import pfinal.friend.Friend_delete;
import pfinal.friend.Friend_find;
import pfinal.friend.Friend_getBoard;
import pfinal.join.Join;
import pfinal.join.JoinClient;
import pfinal.join.JoinConfirm;
import pfinal.join.JoinController;
import pfinal.join.JoinFree;
import pfinal.main.GetPartnerCommand;
import pfinal.main.cl_Home;
import pfinal.main.PartnerListCommand;
import pfinal.main.client_index;
import pfinal.main.free_index;
import pfinal.main.mylist;
import pfinal.main.mypage;
import pfinal.main.login.loginTest;
import pfinal.main.login.loginpage;
import pfinal.message.Message_Delete;
import pfinal.message.Message_Read;
import pfinal.message.Message_Read_Detail;
import pfinal.message.Message_Upload;
import pfinal.message.Message_Write;
import pfinal.message.Message_Write_Detail;
import pfinal.message.PrivateMessage_Upload;
import pfinal.message.PrivateMessage_Write;
import pfinal.mypage_info.career;
import pfinal.mypage_info.m_career;
import pfinal.mypage_info.m_media;
import pfinal.mypage_info.m_menu_ui;
import pfinal.mypage_info.m_quali;
import pfinal.mypage_info.m_skill;
import pfinal.mypage_info.media;
import pfinal.mypage_info.menu_ui;
import pfinal.mypage_info.quali;
import pfinal.mypage_info.skill;
import pfinal.mypage_info.project.PrDeleteProcCommand;
import pfinal.mypage_info.project.PrUpdateCommand;
import pfinal.mypage_info.project.PrUpdateProcCommand;
import pfinal.mypage_info.project.ProjectCommand;
import pfinal.mypage_info.project.ProjectUpdate;
import pfinal.myschool.SchoolChkCommand;
import pfinal.myschool.SchoolDeleteDBCommand;
import pfinal.myschool.SchoolInsertCommand;
import pfinal.myschool.SchoolInsertDBCommand;
import pfinal.myschool.SchoolResultCommand;
import pfinal.myschool.SchoolUpdateDBCommand;
import pfinal.myschool.SchoolUpdateInsertCommand;
import pfinal.myschool.SchoolUpdateResultCommand;


public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory getInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){

		System.out.println("cmd : "+cmd);
		
		//�α���
		if(cmd.equals("login"))
			return new loginpage();
		else if(cmd.equals("logintest"))
			return new loginTest();
		
		//����������
		else if(cmd.equals("free_index"))
			return new free_index();
		else if(cmd.equals("client_index"))
			return new client_index();
		
		//�Խ���
		
		//�۾���
		else if(cmd.equals("prwrite"))
			return new WriteCommand();
		else if(cmd.equals("prwriteProc"))		
			return new WriteProcCommand();
		else if(cmd.equals("prupdate"))
			return new PrUpdateCommand();
		else if(cmd.equals("prupdateProc"))
			return new PrUpdateProcCommand();
		else if(cmd.equals("img"))
			return new ImgUploadCommand();	
		else if(cmd.equals("prdelete"))
			return new PrDeleteProcCommand();		
		
		//�ڼ�������
		else if(cmd.equals("getboard"))
			return new GetBoardCommand();
		else if (cmd.equals("mup")) //�����ϱ� �̵�����
			return new mup();
		else if (cmd.equals("up")) //�����ϱ� �ۼ� ��
			return new up();	
		
		//����Ʈ
		else if (cmd.equals("list")) 
			return new ListCommand();
		else if(cmd.equals("privatelist"))
			return new PrivateListCommand();
		else if (cmd.equals("inter"))  		//���ɱ�� �˻���? ����Ʈ
			return new InterListCommand();
		
		//��Ʈ�ʽ� ���
		else if(cmd.equals("partnerlist"))
			return new PartnerListCommand();
		else if(cmd.equals("getpartner"))
			return new GetPartnerCommand();
	
		//������Ʈ �����ϱ�	
		//��������
		else if (cmd.equals("prolist"))
			return new prolist();		
		else if (cmd.equals("refusal"))
			return new prolist_update_refusal();
		else if (cmd.equals("f_del"))
			return new prolist_update_delete();
		
		//Ŭ���̾�Ʈ
		else if (cmd.equals("cl_prolist"))
			return new cl_prolist();
		else if (cmd.equals("cl_prolist_test"))
			return new cl_prolist_test();
		else if (cmd.equals("cl_up"))
			return new cl_up();
		else if (cmd.equals("cl_del"))
			return new cl_prolist_update_delete();
		else if (cmd.equals("info"))
			return new cl_prolist_info();
		else if (cmd.equals("check_update"))
			return new cl_prolist_update();
		else if (cmd.equals("final_check"))
			return new cl_prolist_update_final();
		else if (cmd.equals("cl_agree"))
			return new cl_agree();
		
		// ��� ������Ʈ ��
		else if (cmd.equals("evaluate"))
			return new cl_RF_Project_List();
		else if (cmd.equals("home"))
			return new cl_Home();
		else if (cmd.equals("back"))
			return new cl_RF_Project_List();
		else if (cmd.equals("evaluatewrite"))
			return new cl_Evaluate_Project();
		else if (cmd.equals("evaluateup"))
			return new cl_Evaluate_Project_Upload();
		else if (cmd.equals("projectfinview"))
			return new cl_Project_Fin_View();
		else if (cmd.equals("finprojectup"))
			return new cl_Project_Fin_Up();
		else if (cmd.equals("finview"))
			return new cl_Project_View();
				
		// ���� ������Ʈ ��
		else if (cmd.equals("frevaluate"))
			return new fr_RF_Project_List();
		else if (cmd.equals("frhome"))
			return new cl_Home();
		else if (cmd.equals("frback"))
			return new fr_RF_Project_List();
		else if (cmd.equals("frevaluatewrite"))
			return new fr_Evaluate_Project();
		else if (cmd.equals("frevaluateup"))
			return new fr_Evaluate_Project_Upload();
		else if (cmd.equals("frprojectfinview"))
			return new fr_Project_Fin_View();
		else if (cmd.equals("frfinprojectup"))
			return new fr_Project_Fin_Up();
		else if (cmd.equals("frfinview"))
			return new fr_Project_View();
		
		//����������		
				
		else if (cmd.equals("mypage")) 
			return new mypage();				
		else if (cmd.equals("inter")) // �������������� ���ɱ�� �߰� �ϱ�
			return new inter();
		else if (cmd.equals("mylist")) 
			return new mylist();
		else if (cmd.equals("career"))
			return new career();
		else if (cmd.equals("skill")) 
			return new skill();
		else if (cmd.equals("quali")) 
	         return new quali();
		else if(cmd.equals("menu_ui"))
			return new menu_ui();
		else if(cmd.equals("media"))
			return new media();
		else if (cmd.equals("m_career")) // �̵���
			return new m_career();
		else if (cmd.equals("m_skill")) 
			return new m_skill();
		else if (cmd.equals("m_quali")) 
	         return new m_quali();
		else if (cmd.equals("m_menu_ui")) 
	         return new m_menu_ui();
		else if (cmd.equals("m_media")) 
	         return new m_media();
		
		//ȸ������
		if(cmd.equals("join"))
			return new JoinConfirm();
		if(cmd.equals("join_client"))
			return new JoinController();
		if(cmd.equals("Free"))
			return new JoinFree();
		if(cmd.equals("Client"))
			return new JoinClient();
		if(cmd.equals("Agree"))
			return new Join();
		
		//������Ʈ? ?????
		if(cmd.equals("project"))
			return new ProjectUpdate();
		if(cmd.equals("projectupload"))
			return new ProjectCommand();
		
		//ģ�����
		if(cmd.equals("friendlist"))
			return new Friend_getBoard();
		if(cmd.equals("deletefriend"))
			return new Friend_delete();
		if(cmd.equals("find"))
			return new Friend_find(); 
		if(cmd.equals("invitefriends"))
			return new Friend_add();
		if(cmd.equals("resfriend"))
			return new Friend_add_confrim();
		
		//�޼���
		if(cmd.equals("message"))
			return new Message_Read();
		if(cmd.equals("messagewrite"))
			return new Message_Write();
		if(cmd.equals("messageupload"))
			return new Message_Upload();
		if(cmd.equals("messagedelete"))
			return new Message_Delete();
		if(cmd.equals("messagedetail"))
			return new Message_Read_Detail();
		if(cmd.equals("messagewritedetail"))
			return new Message_Write_Detail();
		if(cmd.equals("privatemessagewrite")){
			return new PrivateMessage_Write();
		}if(cmd.equals("privatemessageupload")){
			return new PrivateMessage_Upload();
		}
		
		//�б����
		else if(cmd.equals("schoolsc")){
			return new SchoolResultCommand();
		}else if(cmd.equals("myschoolenter")){
			//�б��Է��ϱ� ����. jsp�������� �̵�
			return new SchoolInsertCommand();
		}else if(cmd.equals("myschoolinsert")){
			//DB�� �Է��� �б� �Է�
			return new SchoolInsertDBCommand();
		}else if(cmd.equals("myschoolchk")){
			//db�� �� Ȯ�� �� ���� ��ư
			return new SchoolChkCommand();	
		}else if(cmd.equals("myschoolupdate")){
			return new SchoolUpdateDBCommand();
		}else if(cmd.equals("myschooldelete")){
			return new SchoolDeleteDBCommand();
		}else if(cmd.equals("updateschoolsc")){
			return new SchoolUpdateResultCommand();
		}else if(cmd.equals("myschoolupdateenter")){
			return new SchoolUpdateInsertCommand();
		}
	
	

		return null;
	}
	
}
