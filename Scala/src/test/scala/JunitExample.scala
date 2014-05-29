import org.scalatest.junit.AssertionsForJUnit
import scala.collection.mutable.ListBuffer
import org.junit.Assert._
import org.junit.Test
import org.junit.Before

class JunitExample extends AssertionsForJUnit {
  var stringBuilder: StringBuilder
  var listBuffer: ListBuffer[String]

  @Before def initialize() {
    stringBuilder = new StringBuilder("Scala test")
    listBuffer = new ListBuffer[String]
  }

  // Junit style
  @Test def verify() {
    stringBuilder.append(" is pretty easy")
    assertEquals("Scala test is pretty easy",stringBuilder.toString())
    assertTrue(listBuffer.isEmpty)
    listBuffer += "abc"
    try {
      "verbose".charAt(-1)
      fail()
    } catch {
      case e: StringIndexOutOfBoundsException => // expected
    }
  }

  // ScalaTest style
  @Test def verify2() {
    stringBuilder.append(" is fun")
    assert(stringBuilder.toString() === "Scala test is fun")
    assert(listBuffer.isEmpty)
    listBuffer += "def"
    intercept[StringIndexOutOfBoundsException] {
      "concise".charAt(-1)
    }
  }

}
