with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Directories;       use Ada.Directories;

package body Tasks_IO is
   type Task_Record is record
      Name : String (1 .. 100);
   end record;

   F : File_Type;

   New_Task  : Task_Record;
   Last      : Integer;
   Task_Name : String (1 .. 100) := (others => ' ');
   procedure All_Tasks is
   begin
      Open (F, In_File, "tasks.dat");
      while not End_Of_File (F) loop
         Task_Record'Read (Stream (F), New_Task);
         Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
      end loop;
      Close (F);
   end All_Tasks;

   procedure Add_Task is
   begin
      Ada.Text_IO.Put ("Select Task Name: ");
      Ada.Text_IO.Get_Line (Task_Name, Last);
      New_Task.Name (1 .. Last) := Task_Name (1 .. Last);
      Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
      if Exists ("tasks.dat") then
         Open (F, Append_File, "tasks.dat");
      else
         Create (F, Out_File, "tasks.dat");
      end if;
      Task_Record'Write (Stream (F), New_Task);
      Close (F);
   end Add_Task;
end Tasks_IO;
