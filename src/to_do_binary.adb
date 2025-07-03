with Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Directories;       use Ada.Directories;
with Tasks_IO;

procedure To_Do_Binary is
   Choice : Integer;
begin
   loop
      Ada.Text_IO.Put_Line ("1: View All 2: Add 3: Exit");
      Ada.Text_IO.Put ("Select Option: ");
      Get (Choice);
      Ada.Text_IO.Skip_Line;
      case Choice is
         when 1 =>
            Tasks_IO.All_Tasks;

         when 2 =>
            Tasks_IO.Add_Task;

         when 3 =>
            Ada.Text_IO.Put_Line ("Goodbye");
            exit;

         when others =>
            Ada.Text_IO.Put ("Not An Option");
      end case;
   end loop;
end To_Do_Binary;
