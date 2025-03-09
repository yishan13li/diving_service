package diving_service.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.SQLException;

import diving_service.model.dao.MemberDao;
import diving_service.model.entity.Member;
import diving_service.util.ConnectionFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MemberService {
	
	
	//密碼加密
	public String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("密碼加密失敗", e);
        }
    }
	
	// login
	public Member login(String email, String password) {

		try (Connection conn = ConnectionFactory.getConnection()) {

			MemberDao memberDao = new MemberDao(conn);
			
			// 先將輸入的密碼加密
	        String hashedPassword = hashPassword(password);
			
	        Member member = memberDao.findMemberByEmailAndPassword(email, hashedPassword);

			return member;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
			
	}

	// register member
	public Member registerMember(Member member) {
	    try (Connection conn = ConnectionFactory.getConnection()) {

	        MemberDao memberDao = new MemberDao(conn);

	        if (memberDao.isEmailExist(member.getEmail())) {
	            return null; // 如果電子郵件已註冊，返回 null
	        }

	        memberDao.createMember(member);
	        return member;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	/* =========Read========= */
	public Member getMemberById(Integer id) {
		try (Connection conn = ConnectionFactory.getConnection()) {
			MemberDao memberDao = new MemberDao(conn);
			Member member = memberDao.findMemberById(id);

			if (member == null) {
				member = new Member();
			}

			return member;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public byte[] getPhotoById(Integer id) {

		try (Connection conn = ConnectionFactory.getConnection()) {

			MemberDao memberDAO = new MemberDao(conn);
			Member member = memberDAO.findMemberById(id);

			// 沒有大頭貼
			if (member == null || member.getMemberPhoto() == null || member.getMemberPhoto().length == 0) {
				return Files.readAllBytes(Path
						.of("C:\\Servlet\\workspace\\diving_service\\src\\main\\webapp\\assets\\images\\noImg.png"));
			}
			return member.getMemberPhoto();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null; // 一發生連線錯誤，就會回傳空
	}

	public boolean updateMemberById(Integer id, Member member) {

		try (Connection conn = ConnectionFactory.getConnection()) {

			MemberDao memberDao = new MemberDao(conn);
	        
			if (memberDao.isEmailExistForUpdate(id, member.getEmail())) {
	            return false; // 如果信箱已存在，返回 false
	        }
			
			memberDao.updateMemberById(id, member);

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
