with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
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
   Choice : Integer;

   procedure All_Items is
   begin
      for Item in M.Iterate loop
         Put_Line(Key (Item) & ": "& Integer'Image(M(Item)));
      end loop;
   end All_Items;

   procedure Add_Item is
      Item_Name : String(1..50) := (others => ' ');
      Item_Time : Integer;
      Last : Integer;
   begin
      Put_Line ("Add New Item");
      Put("Select Item Name: ");
      Get_Line(Item_Name, Last);
      Put(Item_Name(1..Last) & " Time: ");
      Get(Item_Time);
      Skip_Line;
      
      M.Include(Item_Name(1..Last), Item_Time);

   end Add_Item;
begin
   M.Include("Wash Dishes", 10);
   loop
      Put_Line("1: View All 2: Add 3: Exit");
      Put("Select Option: ");
      Get(Choice);
      Skip_Line;
      case Choice is
         when 1 =>
            All_Items;
         when 2 =>
            Add_Item;
         when 3 =>
            Put_Line ("Goodbye");
            exit;
         when others =>
            Put("Not An Option");
      end case;
   end loop;
         
end To_Do;
