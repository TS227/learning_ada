with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Strings.Hash;
procedure To_Do is
   package Tasks_Map is new
      Ada.Containers.Indefinite_Hashed_Maps
         (Key_Type => String,
         Element_Type => Integer,
         Hash => Ada.Strings.Hash,
         Equivalent_Keys => "=");
   use Tasks_Map;
   M : Map;

   procedure All_Items is
   begin
      for Item in M.Iterate loop
         Put_Line(Key (Item) & ": "& Integer'Image(M(Item)));
      end loop;
   end All_Items;
   
begin
   M.Include("Wash Dishes", 10);
   All_Items;
end To_Do;
