insert into review values(review_seq.nextval,1,'title','content',5,5,2);
insert into "USER" values(user_seq.nextval,1,'1234','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','tkatordl','010-2323-2322','wa1232@naver.com','Seoul');
insert into review_comment values(review_comment_seq.nextval,1,1,'ㄴ는바보');
insert into review_co_comment values(REVIEW_CO_COMMENT_SEQ.NEXTVAL,1,1,1,1,'ㄴ애도 바보');
insert into "TAG" values(tag_seq.nextval,1,1);

commit;