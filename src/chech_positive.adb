with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Check_Positive is
   Number : Integer;
begin
   Put("Enter a positive integer: ");
   Get(Number);
   if Number > 0 then
      Put (Number);
      Put_Line (" Is Positive");
   end if;
end Check_Positive;