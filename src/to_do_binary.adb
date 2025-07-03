with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;

procedure To_Do_Binary is
   type Task_Record is record
      Name : String (1 .. 100);
   end record;

   F : File_Type;

   New_Task : Task_Record;

   procedure All_Tasks is
   begin
      Open (F, In_File, "tasks.dat");
      Task_Record'Read (Stream (F), New_Task);
      Close (F);
      Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
   end All_Tasks;
begin
   All_Tasks;
   New_Task.Name (1 .. 11) := "Wash Dishes";
   Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
   Create (F, Out_File, "tasks.dat");
   Task_Record'Write (Stream (F), New_Task);
   Close (F);
end To_Do_Binary;
