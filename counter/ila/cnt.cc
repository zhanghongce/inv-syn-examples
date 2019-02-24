
/// \brief Counter -- just a counter
/// with a single instruction:
/// INC c <= c + 1
class CntTest {
public:
  static Ila BuildModel();
};


Ila CntTest::BuildModel() {
  auto m = Ila("counter");
  auto en = m.NewBvInput("en", 1);
  auto v  = m.NewBvState("v" , 4);
  auto INC = m.NewInstr("INC");
  {
    INC.SetDecode(en == 1);
    INC.SetUpdate(v, v + 1);
  }
  return m;
}

