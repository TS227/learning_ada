with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure To_Do_Binary is
   type Task_Record is record
      Name : String (1 .. 100);
   end record;

   F : File_Type;

   New_Task  : Task_Record;
   Last      : Integer;
   Choice    : Integer;
   Task_Name : String (1 .. 100) := (others => ' ');

   procedure All_Tasks is
   begin
      Open (F, In_File, "tasks.dat");
      Task_Record'Read (Stream (F), New_Task);
      Close (F);
      Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
   end All_Tasks;

   procedure Add_Task is
   begin
      Ada.Text_IO.Put ("Select Task Name: ");
      Ada.Text_IO.Get_Line (Task_Name, Last);
      New_Task.Name (1 .. Last) := Task_Name (1 .. Last);
      Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
      Create (F, Out_File, "tasks.dat");
      Task_Record'Write (Stream (F), New_Task);
      Close (F);
   end Add_Task;
begin
   loop
      Ada.Text_IO.Put_Line ("1: View All 2: Add 3: Exit");
      Ada.Text_IO.Put ("Select Option: ");
      Get (Choice);
      Ada.Text_IO.Skip_Line;
      case Choice is
         when 1 =>
            All_Tasks;

         when 2 =>
            Add_Task;

         when 3 =>
            Ada.Text_IO.Put_Line ("Goodbye");
            exit;

         when others =>
            Ada.Text_IO.Put ("Not An Option");
      end case;
   end loop;
end To_Do_Binary;
