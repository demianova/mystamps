/*
 * Copyright (C) 2009-2019 Slava Semushin <slava.semushin@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
package ru.mystamps.web.feature.participant;

import ru.mystamps.web.feature.participant.ParticipantDb.TransactionParticipant;

// @todo #927 ParticipantValidation: remove PARTICIPANT_ prefix from the constants
@SuppressWarnings("PMD.CommentDefaultAccessModifier")
public final class ParticipantValidation {
	
	public static final int PARTICIPANT_NAME_MIN_LENGTH = 3;
	public static final int PARTICIPANT_NAME_MAX_LENGTH = TransactionParticipant.NAME_LENGTH;
	static final int PARTICIPANT_URL_MAX_LENGTH  = TransactionParticipant.URL_LENGTH;
	
	private ParticipantValidation() {
	}
	
}
