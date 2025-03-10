feature 'Attacking' do
  scenario 'see Player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Dave attacked Mittens'
  end
  scenario 'reduce Player 2 by 10' do
    sign_in_and_play
    click_button('Attack')
    #expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
  scenario 'see Player 1' do
    sign_in_and_play
    attack_and_confirm
    click_button('Attack')
    expect(page).to have_content 'Mittens attacked Dave'
  end
  scenario 'reduce Player 1 by 10' do
    sign_in_and_play
    attack_and_confirm
    attack_and_confirm
    expect(page).to have_content 'Dave: 50HP'
  end
end
