package com.springbook.biz.board.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbook.biz.board.Criteria;
import com.springbook.biz.board.ReplyService;
import com.springbook.biz.board.ReplyVO;
@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private final BoardDAOMybatis2 replyDAO;
	@Autowired
    private final  BoardDAOMybatis2 articleDAO;

    @Inject
    public ReplyServiceImpl(BoardDAOMybatis2 replyDAO, BoardDAOMybatis2 articleDAO) {
        this.replyDAO = replyDAO;
        this.articleDAO = articleDAO;
    }

    @Override
    public List<ReplyVO> getReplies(Integer articleNo) throws Exception {
        return replyDAO.list(articleNo);
    }

    @Transactional
    @Override
    public void addReply(ReplyVO replyVO) throws Exception {
        replyDAO.create(replyVO);
       System.out.println(replyVO);
//        articleDAO.updateReplyCnt(replyVO.getArticleNo(), 1);
//    	for (int i = 1; i <= 100; i++) {
//            replyVO.setSeq(1000);
//            replyVO.setReplyText(i+"번째 댓글입니다..");
//            replyVO.setReplyWriter("user0"+(i%10));
//            replyDAO.create(replyVO);
//        }
    }

    @Override
    public void modifyReply(ReplyVO replyVO) throws Exception {
        replyDAO.update(replyVO);
    }

    @Transactional
    @Override
    public void removeReply(Integer replyNo) throws Exception {
        int articleNo = replyDAO.getArticleNo(replyNo);
        replyDAO.delete(replyNo);
//        articleDAO.updateReplyCnt(articleNo, -1);
    }

    @Override
    public List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception {
        return replyDAO.listPaging(articleNo, criteria);
    }

    @Override
    public int countReplies(Integer articleNo) throws Exception {
        return replyDAO.countReplies(articleNo);
    }
}
