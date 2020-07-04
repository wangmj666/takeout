/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     2020/7/3 22:28:18                            */
/*==============================================================*/


/*==============================================================*/
/* Table: Business_information                                  */
/*==============================================================*/
create table Business_information (
   shop_id              INT4                 not null,
   Business_name        VARCHAR(20)          not null,
   Merchants_star       CHAR(5)              null,
   consumption_per_person FLOAT8               null,
   total_sales          INT4                 null,
   constraint PK_BUSINESS_INFORMATION primary key (shop_id)
);

/*==============================================================*/
/* Index: Business_information_PK                               */
/*==============================================================*/
create unique index Business_information_PK on Business_information (
shop_id
);

/*==============================================================*/
/* Table: commodity_categories                                  */
/*==============================================================*/
create table commodity_categories (
   shop_id             INT4                 not null,
   good_fl              INT4                 not null,
   classify_name        VARCHAR(20)          not null,
   good_num             INT4                 null,
   constraint PK_COMMODITY_CATEGORIES primary key (shop_id, good_fl)
);

/*==============================================================*/
/* Index: commodity_categories_PK                               */
/*==============================================================*/
create unique index commodity_categories_PK on commodity_categories (
shop_id,
good_fl
);

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/
create  index Relationship_4_FK on commodity_categories (
shop_id
);

/*==============================================================*/
/* Table: coupon_have                                           */
/*==============================================================*/
create table coupon_have (
   shop_id              INT4                 not null,
   coupon_id            INT4                 not null,
   discount_amount      DECIMAL(8,2)         not null,
   user_id              INT4                 not null,
   coupon_num           DECIMAL              null,
   coupon_deadline      DATE                 null,
   constraint PK_COUPON_HAVE primary key (shop_id, coupon_id, discount_amount, user_id)
);

/*==============================================================*/
/* Index: coupon_have_PK                                        */
/*==============================================================*/
create unique index coupon_have_PK on coupon_have (
shop_id,
coupon_id,
discount_amount,
user_id
);

/*==============================================================*/
/* Index: coupon_have_FK                                        */
/*==============================================================*/
create  index coupon_have_FK on coupon_have (
shop_id,
coupon_id,
discount_amount
);

/*==============================================================*/
/* Index: coupon_have2_FK                                       */
/*==============================================================*/
create  index coupon_have2_FK on coupon_have (
user_id
);

/*==============================================================*/
/* Table: coupon_information                                    */
/*==============================================================*/
create table coupon_information (
   shop_id              INT4                 not null,
   coupon_id           INT4                 not null,
   discount_amount      DECIMAL(8,2)         not null,
   order_require_number INT4                 not null,
   startdate            DATE                 not null,
   endate               DATE                 not null,
   constraint PK_COUPON_INFORMATION primary key (shop_id, coupon_id, discount_amount)
);

/*==============================================================*/
/* Index: coupon_information_PK                                 */
/*==============================================================*/
create unique index coupon_information_PK on coupon_information (
shop_id,
coupon_id,
discount_amount
);

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/
create  index Relationship_2_FK on coupon_information (
shop_id
);

/*==============================================================*/
/* Table: full_reduction_scheme                                 */
/*==============================================================*/
create table full_reduction_scheme (
   shop_id             INT4                 not null,
   full_reduction_id   INT4                 not null,
   full_reduction_fee   DECIMAL(8,2)         not null,
   coupon               DECIMAL(8,2)         not null,
   dadd                 VARCHAR(2)           not null,
   constraint PK_FULL_REDUCTION_SCHEME primary key (shop_id, full_reduction_id )
);

/*==============================================================*/
/* Index: full_reduction_scheme_PK                              */
/*==============================================================*/
create unique index full_reduction_scheme_PK on full_reduction_scheme (
shop_id,
full_reduction_id
);

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create  index Relationship_3_FK on full_reduction_scheme (
shop_id
);

/*==============================================================*/
/* Table: good_comment                                          */
/*==============================================================*/
create table good_comment (
   good_id              INT4                 not null,
   user_id              INT4                 not null,
   shop_id              INT4                 not null,
   good_comment         VARCHAR(100)         not null,
   good_comment_date    DATE                 not null,
   good_star            VARCHAR(6)           null,
   good_picture         CHAR(254)            null,
   constraint PK_GOOD_COMMENT primary key (good_id , user_id )
);

/*==============================================================*/
/* Index: good_comment_PK                                       */
/*==============================================================*/
create unique index good_comment_PK on good_comment (
good_id ,
user_id
);

/*==============================================================*/
/* Index: good_comment_FK                                       */
/*==============================================================*/
create  index good_comment_FK on good_comment (
good_id
);

/*==============================================================*/
/* Table: good_detail                                           */
/*==============================================================*/
create table good_detail (
   good_id              INT4                 not null,
   shop_id              INT4                 null,
   good_fl              INT4                 null,
   good_name            VARCHAR(50)          not null,
   price                FLOAT8               not null,
   favourable_price     FLOAT8               null,
   constraint PK_GOOD_DETAIL primary key (good_id)
);

/*==============================================================*/
/* Index: good_detail_PK                                        */
/*==============================================================*/
create unique index good_detail_PK on good_detail (
good_id
);

/*==============================================================*/
/* Index: Relationship_10_FK                                    */
/*==============================================================*/
create  index Relationship_10_FK on good_detail (
shop_id,
good_fl
);

/*==============================================================*/
/* Table: good_order                                            */
/*==============================================================*/
create table good_order (
   order_id             INT4                 not null,
   shop_id              INT4                 not null,
   user_id              INT4                 not null,
   rider_id             INT4                 not null,
   ori_money            DECIMAL(8,2)         not null,
   fin_money            DECIMAL(8,2)         not null,
   full_reduction_id    INT4                 not null,
   coupon_id            INT4                 null,
   order_time           DATE                 not null,
   requie_time          DATE                 not null,
   addr_id              INT4                 not null,
   order_state          VARCHAR(10)          not null,
   constraint PK_GOOD_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: good_order_PK                                         */
/*==============================================================*/
create unique index good_order_PK on good_order (
order_id
);

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create  index Relationship_6_FK on good_order (
user_id
);

/*==============================================================*/
/* Index: Relationship_9_FK                                     */
/*==============================================================*/
create  index Relationship_9_FK on good_order (
shop_id
);

/*==============================================================*/
/* Table: jidan_coupon                                          */
/*==============================================================*/
create table jidan_coupon (
   shop_id             INT4                 not null,
   coupon_id           INT4                 not null,
   discount_amount      DECIMAL(8,2)         not null,
   user_id             INT4                 not null,
   order_require_number INT4                 null,
   ordered              INT4                 null,
   constraint PK_JIDAN_COUPON primary key (shop_id, coupon_id, discount_amount, user_id)
);

/*==============================================================*/
/* Index: jidan_coupon_PK                                       */
/*==============================================================*/
create unique index jidan_coupon_PK on jidan_coupon (
shop_id,
coupon_id,
discount_amount,
user_id
);

/*==============================================================*/
/* Index: jidan_coupon_FK                                       */
/*==============================================================*/
create  index jidan_coupon_FK on jidan_coupon (
shop_id,
coupon_id,
discount_amount
);


/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail (
   order_id             INT4                 not null,
   good_id              INT4                 not null,
   order_num            INT4                 not null,
   order_price          DECIMAL(8,2)         not null,
   discount_pice        DECIMAL(8,2)         not null,
   constraint PK_ORDER_DETAIL primary key (order_id, good_id)
);

/*==============================================================*/
/* Index: order_detail_PK                                       */
/*==============================================================*/
create unique index order_detail_PK on order_detail (
order_id,
good_id
);

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/
create  index Relationship_8_FK on order_detail (
order_id
);

/*==============================================================*/
/* Table: rider                                                 */
/*==============================================================*/
create table rider (
   rider_id             INT4                 not null,
   rider_name           VARCHAR(10)          not null,
   joining_date         DATE                 not null,
   rider_level          VARCHAR(6)           not null,
   constraint PK_RIDER primary key (rider_id)
);

/*==============================================================*/
/* Index: rider_PK                                              */
/*==============================================================*/
create unique index rider_PK on rider (
rider_id
);

/*==============================================================*/
/* Table: rider_money                                           */
/*==============================================================*/
create table rider_money (
   order_id             INT4                 not null,
   rider_id            INT4                 not null,
   order_time           DATE                 not null,
   user_rider_comment   VARCHAR(6)           null,
   rider_income         DECIMAL(8,2)         not null,
   constraint PK_RIDER_MONEY primary key (order_id, rider_id)
);

/*==============================================================*/
/* Index: rider_money_PK                                        */
/*==============================================================*/
create unique index rider_money_PK on rider_money (
order_id,
rider_id
);

/*==============================================================*/
/* Index: rider_money_FK                                        */
/*==============================================================*/
create  index rider_money_FK on rider_money (
order_id
);


/*==============================================================*/
/* Table: shipping_address                                      */
/*==============================================================*/
create table shipping_address (
   addr_id             INT4                 not null,
   user_id              INT4                 not null,
   province             VARCHAR(10)          not null,
   city                 VARCHAR(10)          null,
   district             VARCHAR(10)          null,
   addr                 VARCHAR(100)         not null,
   linkman              VARCHAR(20)          not null,
   user_tel             VARCHAR(20)          not null,
   constraint PK_SHIPPING_ADDRESS primary key (addr_id)
);

/*==============================================================*/
/* Index: shipping_address_PK                                   */
/*==============================================================*/
create unique index shipping_address_PK on shipping_address (
addr_id2
);

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create  index Relationship_5_FK on shipping_address (
user_id2
);

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table user(
   user_id2             INT4                 not null,
   order_id             INT4                 null,
   user_name            VARCHAR(50)          not null,
   user_sex             VARCHAR(2)           null,
   user_pwd             VARCHAR(25)          not null,
   user_tel             VARCHAR(20)          not null,
   user_mail            VARCHAR(50)          null,
   user_city            VARCHAR(10)          null,
   user_regdate         DATE                 null,
   vip                  VARCHAR(2)           not null,
   vip_lastdate         DATE                 null,
   constraint PK_USER primary key (user_id)
);

/*==============================================================*/
/* Index: user_PK                                               */
/*==============================================================*/
create unique index user_PK on user (
user_id2
);

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/
create  index Relationship_7_FK on user (
order_id
);

alter table commodity_categories
   add constraint FK_COMMODIT_RELATIONS_BUSINESS foreign key (shop_id2)
      references Business_information (shop_id)
      on delete restrict on update restrict;

alter table coupon_have
   add constraint FK_COUPON_H_COUPON_HA_COUPON_I foreign key (shop_id, coupon_id, discount_amount)
      references coupon_information (shop_id, coupon_id, discount_amount)
      on delete restrict on update restrict;

alter table coupon_have
   add constraint FK_COUPON_H_COUPON_HA_USER foreign key (user_id)
      references user (user_id)
      on delete restrict on update restrict;

alter table coupon_information
   add constraint FK_COUPON_I_RELATIONS_BUSINESS foreign key (shop_id)
      references Business_information (shop_id)
      on delete restrict on update restrict;

alter table full_reduction_scheme
   add constraint FK_FULL_RED_RELATIONS_BUSINESS foreign key (shop_id)
      references Business_information (shop_id)
      on delete restrict on update restrict;

alter table good_comment
   add constraint FK_GOOD_COM_GOOD_COMM_GOOD_DET foreign key (good_id)
      references good_detail (good_id)
      on delete restrict on update restrict;

alter table good_comment
   add constraint FK_GOOD_COM_GOOD_COMM_USER foreign key (user_id)
      references user (user_id)
      on delete restrict on update restrict;

alter table good_detail
   add constraint FK_GOOD_DET_RELATIONS_COMMODIT foreign key (shop_id2, good_fl)
      references commodity_categories (shop_id, good_fl)
      on delete restrict on update restrict;

alter table good_order
   add constraint FK_GOOD_ORD_RELATIONS_USER foreign key (user_id)
      references user (user_id)
      on delete restrict on update restrict;

alter table good_order
   add constraint FK_GOOD_ORD_RELATIONS_BUSINESS foreign key (shop_id)
      references Business_information (shop_id)
      on delete restrict on update restrict;

alter table jidan_coupon
   add constraint FK_JIDAN_CO_JIDAN_COU_COUPON_I foreign key (shop_id, coupon_id, discount_amount)
      references coupon_information (shop_id, coupon_id, discount_amount)
      on delete restrict on update restrict;

alter table jidan_coupon
   add constraint FK_JIDAN_CO_JIDAN_COU_USER foreign key (user_id)
      references user (user_id)
      on delete restrict on update restrict;

alter table order_detail
   add constraint FK_ORDER_DE_RELATIONS_GOOD_ORD foreign key (order_id)
      references good_order (order_id)
      on delete restrict on update restrict;

alter table rider_money
   add constraint FK_RIDER_MO_RIDER_MON_GOOD_ORD foreign key (order_id)
      references good_order (order_id)
      on delete restrict on update restrict;

alter table rider_money
   add constraint FK_RIDER_MO_RIDER_MON_RIDER foreign key (rider_id)
      references rider (rider_id)
      on delete restrict on update restrict;

alter table shipping_address
   add constraint FK_SHIPPING_RELATIONS_USER foreign key (user_id)
      references user (user_id)
      on delete restrict on update restrict;

alter table user
   add constraint FK_USER_RELATIONS_GOOD_ORD foreign key (order_id)
      references good_order (order_id)
      on delete restrict on update restrict;

