from aiogram import Bot, Dispatcher, executor, types
import os

BOT_TOKEN = os.getenv('
          8180281549:AAHL6nMzLtAorkKKxKA9iDsHhvxEtVdKVfc
        ')

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands=['start'])
async def start_menu(message: types.Message):
    keyboard = types.InlineKeyboardMarkup(row_width=2)
    keyboard.add(
        types.InlineKeyboardButton("Bono de Registro", callback_data="bono_registro"),
        types.InlineKeyboardButton("Bono Deportivo", callback_data="bono_deportivo"),
        types.InlineKeyboardButton("Bono Live Casino", callback_data="bono_live")
    )
    await message.answer("¡Bienvenido a Jugabet Chile! Elige tu bono:", reply_markup=keyboard)

@dp.callback_query_handler(lambda c: c.data and c.data.startswith('bono_'))
async def process_bonus_selection(callback_query: types.CallbackQuery):
    bonus_links = {
        "bono_registro": "https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb",
        "bono_deportivo": "https://track.juga.live/563eed25-d153-40cd-89f0-16c9979790ce",
        "bono_live": "https://track.juga.live/0cf84ef0-4180-4e81-a8fb-7a18e437aabe"
    }
    selected_bonus = callback_query.data
    link = bonus_links.get(selected_bonus)
    if link:
        await bot.answer_callback_query(callback_query.id)
        await bot.send_message(callback_query.from_user.id, f"¡Aquí está tu enlace para el bono:\n{link}")
    else:
        await bot.answer_callback_query(callback_query.id, text="Bono no encontrado.")

if __name__ == '__main__':
    executor.start_polling(dp)
