with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;

procedure To_Do_Binary is
   type Task_Record is record
      Name : String (1 .. 100);
   end record;

   F : File_Type;

   New_Task : Task_Record;
begin
   New_Task.Name (1 .. 11) := "Wash Dishes";
   Ada.Text_IO.Put_Line (New_Task.Name (1 .. 11));
   Create (F, Out_File, "tasks.dat");
   Task_Record'Write (Stream (F), New_Task);
   Close (F);
end To_Do_Binary;
