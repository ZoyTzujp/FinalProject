package tw.eeit131.first.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="評論")
public class ArticalBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer 評論ID;
	private Integer 會員ID;
	private String 主旨;
	private String 內容;
	private byte[] 圖片;
	private Timestamp 留言時間;
	
	
	
	public ArticalBean(Integer 評論id, Integer 會員id, String 主旨, String 內容, byte[] 圖片, Timestamp 留言時間) {
		super();
		評論ID = 評論id;
		會員ID = 會員id;
		this.主旨 = 主旨;
		this.內容 = 內容;
		this.圖片 = 圖片;
		this.留言時間 = 留言時間;
	}
	
	
	public Integer get評論ID() {
		return 評論ID;
	}
	public void set評論ID(Integer 評論id) {
		評論ID = 評論id;
	}
	public Integer get會員ID() {
		return 會員ID;
	}
	public void set會員ID(Integer 會員id) {
		會員ID = 會員id;
	}
	public String get主旨() {
		return 主旨;
	}
	public void set主旨(String 主旨) {
		this.主旨 = 主旨;
	}
	public String get內容() {
		return 內容;
	}
	public void set內容(String 內容) {
		this.內容 = 內容;
	}
	public byte[] get圖片() {
		return 圖片;
	}
	public void set圖片(byte[] 圖片) {
		this.圖片 = 圖片;
	}
	public Timestamp get留言時間() {
		return 留言時間;
	}
	public void set留言時間(Timestamp 留言時間) {
		this.留言時間 = 留言時間;
	}

}
