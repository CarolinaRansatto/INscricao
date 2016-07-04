require 'test_helper'

class CandidatoMailerTest < ActionMailer::TestCase
  test "editar_inscricao" do
    mail = CandidatoMailer.editar_inscricao
    assert_equal "Editar inscricao", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
