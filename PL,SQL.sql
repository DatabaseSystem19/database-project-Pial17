DECLARE
 teacher_id teacher.teacher_id%TYPE := 1; 
BEGIN
  FOR rec IN (
    SELECT s.subject_code, s.subject_name
    FROM subject s
    JOIN teacher t ON s.subject_code = t.subject_code
    WHERE t.teacher_id = teacher_id
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Subject Code: ' || rec.subject_code || ', Subject Name: ' || rec.subject_name);
  END LOOP;
END;
/

DECLARE
  v_class_id class.class_id%TYPE := 102;

  v_total_students class.total_student%TYPE;
BEGIN
  SELECT total_student INTO v_total_students
  FROM class
  WHERE class_id = v_class_id;

  DBMS_OUTPUT.PUT_LINE('Total students in class ' || v_class_id || ': ' || v_total_students);
END;
/

DECLARE
  v_class_id class.class_id%TYPE;
  v_total_students class.total_student%TYPE;
BEGIN
 
  FOR rec IN (SELECT * FROM class)
  LOOP
    v_class_id := rec.class_id;
    v_total_students := rec.total_student;
    
    DBMS_OUTPUT.PUT_LINE('Class ID: ' || v_class_id || ', Total Students: ' || v_total_students);
  END LOOP;
END;
/

CREATE OR REPLACE FUNCTION compare_blood_types(
  p_teacher_id IN NUMBER,
  p_student_id IN NUMBER
) RETURN VARCHAR2 IS
  v_teacher_blood_type VARCHAR2(10);
  v_student_blood_type VARCHAR2(10);
BEGIN

  SELECT t.blood_group INTO v_teacher_blood_type
  FROM teacher t
  WHERE t.teacher_id = p_teacher_id;
  
  SELECT s.blood_group INTO v_student_blood_type
  FROM student s
  WHERE s.student_id = p_student_id;
  
  -- Compare the blood types
  IF v_teacher_blood_type = v_student_blood_type THEN
    RETURN 'Same Blood Type';
  ELSE
    RETURN 'Different Blood Types';
  END IF;
END;
/

set serveroutput on
declare
v varchar2(40);
begin
v:=compare_blood_types(3,4);
end;
/
