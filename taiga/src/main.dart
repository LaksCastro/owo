import "./components/initializer.dart";
import "./taiga/main.dart";

void main() {
  try {
    Initializer initializer = Initializer();
    initializer.start();

    Taiga taiga = Taiga();
    taiga.start();
  } catch (e) {
    print("An error ocurred:");
    print(e);
  }
}
