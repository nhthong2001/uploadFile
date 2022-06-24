CREATE TABLE account (
	"id" serial NOT NULL,
	"username" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
	CONSTRAINT "Account_pk" PRIMARY KEY ("id")
);



CREATE TABLE course (
	"id" serial NOT NULL,
	"course_name" TEXT NOT NULL,
	"amount_student" integer NOT NULL,
	"start_date" DATE NOT NULL,
	CONSTRAINT "Course_pk" PRIMARY KEY ("id")
);


INSERT INTO public.account(username, password)
	VALUES ('nht','nht'),
	('admin', 'admin'),
	('user','user');

INSERT INTO public.course(course_name, amount_student, start_date)
	VALUES ('Spring Boot', 50, '2022-05-01'),
			('Java Core', 60, '2022-05-20'),
			('ReactJS', 70, '2022-06-01');




